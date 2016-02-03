# dotfiles

These are my dot files and configuration scripts for new machines. Basically, a few routines to get the basics of a new computer up to speed, and to keep all my configurations in a nice place, so I can get back to them. 

**NOTE**: if you want to make use of these, I strongly suggest looking through the contents of the files before running any of the commands, as they may install software and libraries you don't want or need. Use with caution !

## Instructions

Start off by reading the files. It's good to know what you're getting yourself in to! After that, a few basic rules apply:

- files should be run in the order of the numbers on the files

The numbers (`1-` and such) are there as guidance and grouping of "configuration level." Basically, files in the `1-` group rely only on software that will come with a mac. Those in the `2-` group are the same, but also can use things installed by the `1-` scripts, and so on. You should run all the scripts in one number group before proceeding to the next number group.

- backup any configuration you currently have before running these scripts

It's very likely I won't be adding much in the way of safe guards here, so if you want to try these out, be sure to back up any existing dot files, etc. you already have.

## Manifest

### `1-init.sh`

This will install tools that don't have any package managers, etc. Right now, it's the dot files themselves, and [homebrew](http://brew.sh).

### `2-brew.sh`

This will install many useful tools and resources that are managed via homebrew, and it's caskrooms. Requires homebrew being installed (you *did* read the instructions above, right?)


## Future developments

I plan to add any needed [npm](https://www.npmjs.com) tools to a script `3-npm.js`, which may include things like [gulp](http://gulpjs.com), [grunt](http://gruntjs.com), etc. 

I also want to complete set up as much as possible with other apps [fish shell](https://fishshell.com), and other ones. For fish, it will include installing custom functions, and tools like [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish). Those will go in files probably at the `3-` level since they arequire brew installations to complete.
