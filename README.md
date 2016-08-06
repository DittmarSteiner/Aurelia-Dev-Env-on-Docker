# Aurelia on Alpine Docker

*Three steps to do modern web develop with [Aurelia](http://aurelia.io/) packed in a [Docker](https://www.docker.com/) container – no custom Node.js/npm and else installation required* 🙂

## Build Docker image
*This is a Linux-only example.*

The build args `UID=$(id -u)` and `USERNAME=$USER` provide the current user ID and name.  
This is helpful during development since all files that are created from within the conatiner will provide read/write access for the current user outside the container.

    $ docker build \
        --build-arg UID=$(id -u) \
        --build-arg USERNAME=$USER \
        -t aurelia ./

## Commandline Tool `aurun`

### Help

    $ aurun help
    Usage: aurun [command] [options]
    Commands:
    <none>      1. Creates a new project in none present in ./project  or
                2. Starts the container  or
                3. Log into the running container (tty)

    status      Container running or not
    stop        Stop the container (10 sec)
    kill        Kill the container
    rm          Remove the container
    logs        Read all the logs
    restart     Clear all logs and restart the container
    restart -f  forced restart
    -h, --help  This help

    Hint:
    $ echo "complete -W 'help kill logs restart rm status stop' aurun">~/.bashrc && source ~/.bashrc

### Install `aurun`

    $ sudo ln -s `pwd`/aurun /usr/local/bin/aurun

### Create an Aurelia Project
If no directory `./project` or `./project/package.json` is available then you will be asked to create a new Aurelia project.

    $ aurun 

Just follow the steps.

### Start Container
If there ist no Docker container present yet a new one will be created.

    $ aurun

Open [http://localhost:9000/](http://localhost:9000/) 
or the cool BrowserSync [http://localhost:3001/](http://localhost:3001/).  
Hitting `control-c` detaches you from the container but the container will continue running.

If the container is already running you will join the container shell (tty).

    $ aurun
    Joining container '<your-project-name>'...

    Hints: Try
        $ npm install bootstrap --save --no-optional
    or
        $ npm install jquery@^2.2.4 --save --no-optional

    /<your-project-name> $ _

`control-d` closes the shell but keeps the container running.

### Stop Container

    $ aurun stop

The container stops after 10 sec, so running code generation will not be damaged (hopefully). 

### Kill Container

    $ aurun kill

The container will be stopped immediately. Be a little careful, so no code generation is running because of some code edits of yours. 

### Logs

    $ aurun logs

Just like `tail -f`.

To backup logs call, for example

    $ aurun logs > /tmp/aul1

and hit `control-c`

### Restart Container

    $ aurun restart

Stops the container, clears all logs and starts it again.  
Hitting `control-c` detaches you from the container but the container will continue running.

### Remove Container

    $ aurun rm

The container will be stopped immediately (kill) and removed. 
All logs will be lost.

*Happy coding!*

    ------------------------------------------------------------------------------
    ISC License http://opensource.org/licenses/isc-license.txt
    ------------------------------------------------------------------------------
    Copyright (c) 2016, Dittmar Steiner <dittmar.steiner@gmail.com>

    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
    ------------------------------------------------------------------------------
