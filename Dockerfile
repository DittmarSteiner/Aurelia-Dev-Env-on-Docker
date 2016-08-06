# ------------------------------------------------------------------------------
# ISC License http://opensource.org/licenses/isc-license.txt
# ------------------------------------------------------------------------------
# Copyright (c) 2016, Dittmar Steiner <dittmar.steiner@gmail.com>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# ------------------------------------------------------------------------------

# Pass your current user ID and name to run Aurelia CLI as user you
# $ sudo docker build --force-rm --build-arg UID=$(id -u) --build-arg USERNAME=$USER -t aurelia ./

FROM alpine

MAINTAINER Dittmar Steiner <dittmar.steiner@gmail.com>

ENV LANG C.UTF-8

ARG UID
ARG USERNAME

RUN adduser -D -u ${UID} ${USERNAME} ${USERNAME} \
    && apk --update add curl git nodejs \
    && npm install -g aurelia-cli --save \
    && npm install -g typings --save \
    && npm cache clear \
    && echo \
    && echo '    !!! WARNING: This image is for development only — NEVER use in production on a server !!!' \
    && echo

WORKDIR /project

USER ${USERNAME}

CMD ["sh"]
