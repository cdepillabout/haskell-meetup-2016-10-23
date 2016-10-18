
Haskell 勉強会 2016-10-23
=========================

This is the repo we will be using as a skeleton for the Haskell walkthrough.

The following is the setup instructions working with this repo (and Haskell
projects in general).  It can take up to 30 minutes if you are installing from
scratch.  You'll probably want to do this before Sunday, 2016-10-23.

## Step 0: Clone this Repo

It goes without saying, but you'll need to clone this repo.  You'll also need
to be inside the repo to run the subsequent `stack` commands:

```sh
$ git clone git@github.com:cdepillabout/haskell-meetup-2016-10-23.git
...
$ cd haskell-meetup-2016-10-23/
```

## Step 1: Install `stack`

`stack` is a package manager and build tool for Haskell.

You can install it with the following installation instructions:

https://docs.haskellstack.org/en/stable/README/#how-to-install

Once it's installed, you should be able to see its version:

```sh
$ stack --version
Version 1.2.1, Git revision b79dae1d554ccee5036f15afc58218110f3e5437 (4032 commits) x86_64 hpack-0.14.0
```

Make sure you have a version no older than mine.

## Step 1.5: Upgrading `stack`

If you already have an older version of `stack` installed, you may be able to
use `stack`s upgrade command:

```sh
$ stack --version
Version 1.0.4.3 ...
$ stack upgrade
...
$ stack --version
Version 1.2.1, Git revision b79dae1d554ccee5036f15afc58218110f3e5437 (4032 commits) x86_64 hpack-0.14.0
```

You might want to check out `stack`'s upgrade instructions:

https://docs.haskellstack.org/en/stable/install_and_upgrade/#upgrade

## Step 2: Install `ghc`

This repo is using `ghc-8.0.1`.  If you don't already have it installed, I
recommend installing it with `stack`. This should take a relatively long time:

```sh
$ stack setup
```

## Step 3: Build this Repo

Now that you have `stack` and `ghc` installed, you can finally build this repo.
This should also take a long time:

```sh
$ stack build
```

## Step 4: Make Sure Everything Built Correctly

Here's a simple command to use to make sure everything was built correctly:

```sh
$ stack exec -- haskell-api-exe
someFunc
```

## Conclusion

If you're interested, on Sunday I can explain in more detail each of these
commands.

