# RUN vs. CMD

Often it's easy to copy/paste/modify `Dockerfile`s without understanding all of
the magic. In this case, I wasn't 100% sure what the difference was between
`RUN` and `CMD`.

`RUN` executes a command once at build time.

`CMD` executes a command once at runtime.

You might use `RUN` to create directories, or call `yum` to install things.

You'd use `CMD` at the end to start a web server.