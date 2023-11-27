---
title: Signing git commits with SSH keys
author: Emmanuel Bernard
tags: [ "tool" , "git" ]
#classes: wide
header:
  teaser: /images/blog/git-Logo-1280x800.png
---
Today I learned that you could sign your Git commits not only via a gpg key but also via a ssh key.
Let's see how.

![Git logo keyboard](/images/blog/git-Logo-1280x800.png)

## GPG keys and Git signing

I've never had the rigor to use a maintain a gpg key over the years.
For some reasons, I've always found it too cumbersome.

On the other hand, I've managed my ssh keys pretty well (you better be to log into remote machines, right?).
I've been working on a small project for my French podcast [Les Cast Codeurs](https://lescastcodeurs.com) where the main maintainer is enforcing commit signing.
That's a good thing but I felt like one more thing between me a success!
So I investigated how to do SSH signing.

## How to set up ssh signing for your git project

Without further due

```
git config user.name "Emmanuel Bernard"
git config user.email "my-email@example.net"
git config user.signingkey "~/.ssh/id_mykey.pub"

git config gpg.format ssh
git config commit.gpgsign true
git config tag.gpgsign true

git config gpg.ssh.allowedSignersFile "~/.config/git/allowed_signers"
```

Any command `git config` can be set to `git config --global` if you want to apply the setting all your git repos by default (on that machine anyways).

`user.name` is useful for aesthetic reasons.
`user.email` is useful to match the key as we will see later and I think GitHub might use the email for some mapping.

`user.signingkey` is the SSH key you want to use to sign.
You can use `ssh-agent` to avoid being asked your password for every commit.

`gpg.format` is where the magic happens, instead of using gpg, it will look for the ssh format.

`commit.gpgsign` and `tag.gpgsign` are optional and will simply sign all commits by default.
If you don't, you need to add `-S` to your operations: `git commit -a -S "Add documentation"`

We now have signed but how do we verify?

## GitHub `verified`

GitHub can mark commits as verified if you give it the (public) ssh key you plan to commit with.
Go to settings, SSH and GPG keys, and add a new SSH key by selecting the key type Signing key.
You can use the same SSH key to ssh into GitHub (authentication key) and to sign but you need to register it twice (once under each category) explicitly.

Boom, your commits will be nicely marked `Verified`.

## Local verification

What's good with GPG is that there is a notion of ring of trusted keys, no so much with SSH keys.
To circumvent that, you can create a file containing all the SSH keys you want trusted.

`gpg.ssh.allowedSignersFile` is that file reference.
The file itself should contain the email (used to sign commits as) followed by the key type and then the key.

```
my-email@example.net ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0wmN/Cr3JXqmLW7u+g9pTh+wyqDHpSQEIQczXkVx9q code@example.net
```

Next, you can run `git log --show-signature` which will display validated signatures.
If you don't you will get an error message : `error: gpg.ssh.allowedSignersFile needs to be configured and exist for ssh signature verification`.

```
$git show --show-signature
commit fd2eb29c9dedd44b096e7e73463a94d831d8b994 (HEAD -> main)
Good "git" signature for my-email@example.net with RSA key SHA256:j6IC35JvTZtbXvRcdOtZzGZjjADM5mvtTqhS8QT+VFo
Author: Emmanuel Bernard <my-email@example.net>
Date:   Mon Nov 27 15:06:32 2023 +0100

    Add documentation

```

That's it and is easy enough to set up.
