---
title: Anthropic has improved function calling and that's good
author: Emmanuel Bernard
tags: [ "Agentic", "AI" ]
classes: wide
header:
  teaser: /images/blog/dog-code.gif
---
If you've used function calling in your agentic apps, you know the challenges:

* Piling up tools consumes a lot of tokens as each tool definition is carried in your context window.
* Having many tools can confuse the LLM, which might not call the "best one".

Anthropic has added a few interesting features to their API to address this problem.

## Tool Search Tool

This one defers loading tool definitions until they're actually needed.
For each tool, you decide whether to eagerly load the tool definition upfront for Claude.
If you don't load it, Claude will rely on a tool search tool that has the list of all available tools.
Here the LLM needs to guess two things: that it needs or can use a tool, and infer the actual keywords to find that tool.

Exact search and BM25 are available.

I can see how each agentic framework could implement this itself, without having to rely on Claude's specific behavior.
The framework could let the user set the mandatory tools and the optional tools for a given prompt call.
The framework would then have its own search tool implementation.

This is useful when you start to see a proliferation of tools in a "wide open" prompt.

## Programmatic tool calling

This one addresses the n+1 problem through code generation—kind of like just-in-time compilation for tool orchestration.
Instead of the LLM orchestrating 3 or more separate tool calls, it recognizes the need to chain tools together.
So it generates code that does the chaining and asks for that code to be executed.

This brings more predictable behavior I think, and I am in the camp of people that think LLMs should generate tools for most reproducible tasks: it increases determinism and gets much cheaper in both cost and resources.

I can see this being very useful for ChatBot / Assistant style apps where the tools are defined there (typically Claude Desktop).
For agentic apps though, I'm less certain.
On one hand, it could be useful.
On the other hand, the agentic designer could build a higher-level API anticipating these needs and expose it as an MCP tool; it feels like the Backend For Frontend (BFF) pattern.

Plus, letting the LLM generate code that I'll execute in my agent (even with sandboxing) makes me a bit uneasy today.
Anyway, this is implementable in an agent as well, though it feels harder than the Tool Search Tool approach.

## Tool Use Example

I love this approach, probably because my brain loves to generalize from examples as well.
You send not only the tool API definition to the LLM but also examples of tool usage.
If you see a tool that's repeatedly "miscalled" by the LLM, adding tool examples sounds like a great way to improve the situation.

Agentic frameworks could implement this pattern natively, but I can see how it might pollute the context window more than improve things.

## More info

There is a detailed blog by our Anthropic wizards https://www.anthropic.com/engineering/advanced-tool-use if you want to dig further.
