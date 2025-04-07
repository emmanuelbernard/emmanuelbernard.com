---
title: MCP Servers, Claude Desktop and fun with PATHs
author: Emmanuel Bernard
tags: [ "tool", "AI" ]
classes: wide
header:
  teaser: /images/blog/mcp-logo-light.png
---
If you are playing with AI as a developer, you might has heard of [Model Context Protocol](https://modelcontextprotocol.io) (MCP) which is a way for an app to connect an LLM with some capabilities like an API, a file explorer, a database etc.
The primary app is [Claude Desktop](https://claude.ai/download) today even though there are others like [Goose](https://block.github.io/goose/).

One problem you might have stumbled upon is that Claude Desktop cannot connect to your MCP server(s) because the environment to run docker or npx is different between your terminal and Claude Desktop.
Maybe you use homebrew, asdf, mise or any other environment isolator.

![MCP logo](/images/blog/mcp-logo-light.png)

## How MCP servers are run by Claude Desktop?

Many are local servers running alongside Claude Desktop (on the same machine).
Claude Desktop does start these processes and the command to start them is defined in Claude Desktop's JSON config file.
On macOS, it is at `/Users/username/Library/Application Support/Claude/claude_desktop_config.json`.

Many servers are writen as nodejs apps and use `npx` to start.
Alternatively, you can use a container image to run the server.
In both case, Claude Desktop starts them when the Claude app starts.

## Environment problem

This means that you need docker (or podman in my case) and npx to be available by Claude Desktop.
As a developer I try to isolate environments, so my nodejs version is installed per directory thanks to [asdf](https://asdf-vm.com/).

And unfortunately, this environment is not inherited by Claude Desktop, and it failed to start my MCP servers.

## Setting environment to the rescue

Luckily you can set the proper environment variables in the Claude Desktop configuration file. Look out for `PATH` and `ASDF_*` in the following example

```
{
  "globalShortcut": "Ctrl+Space",
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-brave-search"
      ],
      "env": {
        "BRAVE_API_KEY": "<your API key>",
        "PATH": "/Users/username/.asdf/shims:/usr/bin:/bin",
        "ASDF_DIR": "/opt/homebrew/opt/asdf/libexec",
        "ASDF_DATA_DIR": "/Users/username/.asdf",
        "ASDF_NODEJS_VERSION": "22.10.0"
      }
    },
    "github": {
      "command": "podman",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "GITHUB_PERSONAL_ACCESS_TOKEN",
        "mcp/github"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<Your access token>",
        "PATH": "/opt/homebrew/bin:/usr/bin:/bin"
      }
    }
  }
}
```

And voilà!
Claude Desktop now starts and connects to the MCP servers.

A few things to notice:

* I use homebrew so I set it up in the main `PATH`
* use `podman` and not `docker` as the alias is not set up in the Claude Desktop environment
* it is unfortunate but you need to set the nodejs version which makes the setup a bit brittle 

I imagine the configuration ergonomics of so called MCP hosts will get better over time.
