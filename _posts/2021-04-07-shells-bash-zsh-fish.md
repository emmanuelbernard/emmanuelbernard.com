---
title: Which shell to use? bash, zsh, fish, something else?
author: Emmanuel Bernard
tags: [ "command-line" ]
header:
  teaser: /images/blog/starship.png
---
I have been using `bash` as a shell for as long as I remember and added prompt customization for almost as long as I remember.
I felt the urge to revisit this and asked around what the favorite shell was and I investigated a bit.

## Context
macOS has decided to deprecate `bash` in favor of `zsh`.
It has something to do with [licensing](https://thenextweb.com/dd/2019/06/04/why-does-macos-catalina-use-zsh-instead-of-bash-licensing/) and being fed up with maintaining a decade old `bash` version themselves.

It was not a blocker for me as [Homebrew](https://brew.sh/) lets you install an up to date `bash` version anyways but I’ve been increasingly dissatisfied.
My prompt uses [Powerline](https://powerline.readthedocs.io/en/master/), a Python based prompt that I found a bit brittle.
I had to fix it every new minor version of Python coming due to path changes.
And I was in dread of making it fall into working condition every time I wanted to change something.

Onto finding my new home shell.
One big caveat before that, I am perfectly happy writing my scripts in `bash` and won’t change my _programming language_, so this post is focused on the shell and prompt aspect of the problem.

## And the winner is
I got seduced by _Zsh_ + _oh-my-zsh_ for its plugin ecosystem and attachable auto suggestion features and am using _Starship_ to customize the prompt.
But that's just me.
Read more to know which one is right for you.

![](/images/blog/starship.png)

## Bash and Starship
If you want minimal changes and a zero fiddling prompt solution, `bash` + Starship is for you.
Considering `bash` remains the most deployed, you can’t go wrong compatibility wise.

The first good surprise I’ve found is [Starship](https://starship.rs/).
Starship is a cross-shell prompt written in Rust (from the “everything is better in Rust” movement).
I really love it for a few very simple things.

It’s fast, well I guess you can +1 Rust for that one.
Everything is already integrated into one simple executable, so no need to maintain plugins, figure out why the interpreter no longer works etc.
It is shell agnostic, so any investment you make on it will work equally for `bash` `zsh` or `fish`. To my point, I can now start in `bash` or `zsh` and have a similar prompt experience.
And finally, it focuses on the prompt and nothing else.

## Fish
The extreme to `bash` is `Fish`.
For people that wants something that is entirely integrated, just works and has some nice UI niceties, [fish shell](https://fishshell.com/) is the way to go.

I have not tested it thoroughly myself but I have heard of quite a few people really happy with it, in particular the proposed line completion from history.
No additional install, it just works with great auto suggestions.
From that angle, Fish is unbeatable.

Be aware of one key aspect though, Fish is the furthest away from other shell syntaxes (especially `bash`), so you might encounter some incompatibilities.
Once such example is the inability for [JBang](/blog/2021/01/18/jbang/) to let Java files be executable.
Another is that setting of environment variable does not follow the classical `export KEY=VALUE` model.

For these reasons, I left this choice out as I did not want a radical rewriting of my `.bashrc` file.

## Zsh
[Zsh](https://www.zsh.org/) is for people wanting an interesting mix of a good compatibility with `Bash` and an ecosystem of plugins with a reasonable installation process.

Zsh is often combined with [Oh My Zsh](https://ohmyz.sh/) a plugin system and collection of plugins that enhance the shell. Oh my zsh covers several aspects.

It’s a plugin system to integrate multiple Zsh scripts. This is quite handy as instead of customizing one’s own `.zshrc` (`.bashrc`) with custom code, you simply import plugins. It makes for a more maintainable system.

It’s a theme provider in particular to the prompt, and let people customize the prompt ad nauseam.
I am not personally making use of it as I delegate that task to Starship.

It’s a collection of curated plugins for a wide variety of tools (git, maven, kubernetes etc). Each of these plugins offer one of the following features: add to the prompt, add common aliases to shorten commands, add auto completion capabilities, add tool integrations. Tool integrations are things like ssh-agent, vi mode, nicer history navigation.

### Special Zsh plugin mentions

I might have gone heavy on the plugin side but I have enabled the following so far:

* git — auto completion and some aliases
* osx
* autojump — integration with [autojump](https://github.com/wting/autojump), a must have to navigate directories
* colored-man-pages — who does not like colors
* copydir — copy the path of the current folder in the system clipboard
* copyfile — same for the file passed as parameter
* docker — for its completion
* dotenv — sources the `.env` file of the directory
* git-auto-fetch — fetch the remotes of the git repo you are in
* git-escape-magic — some tool to work around some Zsh glob issue with `HEAD^` and friends
* httpie — completion
* oc — completion for OpenShift command
* ssh-agent — ssh-agent integration
* vi-mode — because there is only one sane keybinding
* zsh-sdkman — installed in custom, sdkman completion

I also use [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) which is a Fish-like autosuggestions for `zsh`

## Honorable mentions

`ctrl+r` lets you search history but is not the most usable user experience. [McFly](https://github.com/cantino/mcfly) is a replacement that works for all shells and offers a more user friendly interface. 

While we talked shells, some people recommended some terminal emulators:

* lots of people re using [iTerm2](https://iterm2.com/) (macOS).
* some recommended [kitty](https://sw.kovidgoyal.net/kitty/) which is a fast GPU accelerated terminal emulator
* others mentioned [Alacritty](https://github.com/alacritty/alacritty) which is also OpenGL accelerated and claims to be the fastest. One interesting philosophy is that it does not support tabs nor splits as tmux or screen do it already. I'm personally giving it a spin.

## Ready to jump?

You can start and experiment by starting the shell from the prompt

```bash
# enter zsh
$ zsh
# come back to my default shell
$ exit
```

When ready for the big jump, if your shell is present in `/etc/shells`, go and run `chsh -s /bin/zsh` or whatever is your final choice.

Do you ahve tips or experience, let's share them on Twitter. I'm here at [@emmanuelbernard](https://twitter.com/emmanuelbernard).
