---
title: Anthropic has improved function calling and that's good
author: Emmanuel Bernard
tags: [ "Agentic", "AI" ]
classes: wide
header:
  teaser: /images/blog/dog-code.gif
---
For people that have used function calling in their agentic apps,
you know that

* piling up tools can consume a lot of tokens as the definition of each tool is carried along in your context window.
* having many tools can confuse the LLM which might not call the "best one"

Anthropic in their API have added a few interesting features to address this problem.

## Tool Search Tool

This one is fundamentally a deferred technique.
In each tool, you decide whether you want to tool definition to be eagerly loaded by Claude.
If not loaded, then Claude will rely on a tool search tool that has the list of all available tools.
Here the LLM needs to guess 1. that it needs or can use a tool 2. the actual keywords to find that tool.

Exact search and BM25 are available.

I can see how each agentic framework could implement that themselves, without having to rely on Claude's specific behavior.
The framework, could let the user set the mandatory tools and the optional tools for a given prompt call.
The framework would then have its own search tool implementation.

This is useful when you start to see a proliferation of tools in a "wide open" prompt.

## Programmatic tool calling

This one is essentially some form of Just In Time compilation or addressing the n+1 problem.
Instead of orchestrating, from the LLM, 3 or more tool calls, the LLM knows that it needs to chain these tools.
Therefore, it generates a code that does that chaining and ask for that code to be executed.

This bring higher order determinism I think and I am in the camp of people that think that LLM should generate tools for most of the reproducable tasks: it increases determinism and gets much cheaper in cost and in resource.

I can see this being very useful for ChatBot / Assistant style apps where the tools are defined there (typically Claude Desktop).
For agentic apps, I am less certain.
It could be useful but I also imagine that the agentic designer could build a higher order API anticipating the needs and maybe expose it as an MCP tool.
Feels like the Backend For Frontend (BFF) pattern.
The idea of letting the LLM generate a code that I will execute in my agent (even if the platform offers some sandboxing), leaves me with a bit of uneasiness today.
Anyway, this is implementable in an agent as well I think though it feels harder than the Tool Search Tool approach.

The last one is about tool usage and examples

## Tool Use Example

I love this approach, probably because my brain loves to generalize out of examples as well.
The basic idea is that you send not only the tool API definition to the LLM but also example of tool usage.
If you see a tool that's repeateldy "miscalled" by the LLM, adding tool examples sounds like a great way to improve the situation.

This pattern, might be implemented natively by agentic frameworks but I can see how it could pollute the context windowm more than improve things.

## More info

There is a detailed blog by our Anthropic wizards https://www.anthropic.com/engineering/advanced-tool-use if you want to dig further.
