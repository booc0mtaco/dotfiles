# dotfiles

These are my dot files and configuration scripts for new machines. Basically, a few routines to get the basics of a new computer up to speed, and to keep all my configurations in a nice place, so I can get back to them. 

**NOTE**: if you want to make use of these, I strongly suggest looking through the contents of the files before running any of the commands, as they may install software and libraries you don't want or need. Use with caution !

## Instructions

Start off by reading the files. It's good to know what you're getting yourself in to! After that, a few basic rules apply:

- files should be run in the order of the numbers on the files

The numbers (`1-` and such) are there as guidance and grouping of "configuration level." Basically, files in the `1-` group rely only on software that will come with a mac. Those in the `2-` group are the same, but also can use things installed by the `1-` scripts, and so on. You should run all the scripts in one number group before proceeding to the next number group.

- backup any configuration you currently have before running these scripts

It's very likely I won't be adding much in the way of safe guards here, so if you want to try these out, be sure to back up any existing dot files, etc. you already have.

### Manual things not included here

* I'm a big fan of [solarized][solarized] color schemes. Use this link to install it for  Terminal.app
* You'll need to set each app that you want to start on login manually. Each has its own method.
* Logins aren't handled by these scripts, for obvious reasons. 

[solarized]: http://ethanschoonover.com/solarized

## Manifest

### `1-init.sh`

This will install tools that don't have any package managers, etc. Right now, it's the dot files themselves, and [homebrew](http://brew.sh).

### `2-brew.sh`

This will install many useful tools and resources that are managed via homebrew, and it's caskrooms. Requires homebrew being installed (you *did* read the instructions above, right?).

- for a full list of installed applications, run `brew cask list`

### `3-atom.sh`

Set up the atom editor with plugins and settings. Set up usage options by copying the apprpriate settings into place.

### `3-oh-my-fish.sh`

Install the oh my fish tools. After installation, it is safe to switch over to fish shell! But, a few things to install remain:

#### Install robbyrussell shell prompt

I like this one. Using `omf`, you can install it with

	omf install robbyrussell
	omf install beloglazov
	
Once done, update the default shell with `chsh`. The path to fish will be `/usr/local/bin/fish`.

## Future developments

I plan to add any needed [npm](https://www.npmjs.com) tools to a script `3-npm.js`, which may include things like [gulp](http://gulpjs.com), [grunt](http://gruntjs.com), etc. 
