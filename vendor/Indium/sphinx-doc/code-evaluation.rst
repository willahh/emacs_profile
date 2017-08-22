.. _interaction:

Interaction in JS buffers
=========================

Indium comes with a minor mode called ``indium-interaction-mode`` for interactive
programming. To enable it in all JavaScript buffers, add something
like the following to your Emacs configuration: ::

  (require 'indium)
  (add-hook 'js-mode-hook #'indium-interaction-mode)

When ``indium-interaction-mode`` is on, you can evaluate code, inspect objects and
add or remove breakpoints from your buffers.

Evaluating and inspecting
-------------------------

Here's a list of available keybindings:

- ``C-x C-e``: Evaluate the JavaScript expression preceding the point.
- ``C-M-x``: Evaluate the innermost function enclosing the point.
- ``C-c M-i``: Inspect the result of the evaluation of an expression (see
  :ref:`inspector`).
- ``C-c M-:``: Prompt for an expression to evaluate and inspect.
- ``M-x indium-eval-buffer``: Evaluate the entire buffer.

Switching to the REPL buffer
----------------------------

Press ``C-c C-z`` from any buffer with ``indium-interaction-mode`` turned on to
switch back to the REPL buffer (see :ref:`repl`).

Adding and removing breakpoints
-------------------------------

You need to first make sure that Indium is set up correctly to use local files
(see :ref:`local-files`).

- ``C-c b b``: Add a breakpoint
- ``C-c b c``: Add a conditional breakpoint
- ``C-c b k``: Remove a breakpoint
- ``C-c b K``: Remove all breakpoints from the current buffer
- ``C-c b e``: Edit condition of a breakpoint
- ``C-c b l``: List all breakpoints and easily jump to any breakpoint  
- ``C-c b d``: Deactivate all breakpoints (the runtime won't pause when hitting a breakpoint)
- ``C-c b a``: Activate all breakpoints (it has no effect if breakpoints have not been deactivated)

Once a breakpoint is set, execution will stop when a breakpoint is hit, and the
Indium debugger pops up (see :ref:`debugger`).

Since Indium 0.7, breakpoints are supported in source files with an associated sourcemap, see :ref:`sourcemaps`.

.. Note:: Breakpoints are persistent: if the connection is closed, when a new
          connection is made Indium will attempt to add back all breakpoints.

Live code update (hot-swapping JavaScript sources)
--------------------------------------------------

Indium supports live code updates without the need to reload the browser tab or
restart the nodejs process.

This feature works with by hot-swapping the script source, and works even with
lexical closures.

.. Note:: This feature currently in only available for Chrome & Chromium.

To enable live updates, make sure Indium is set up to use local files (see
:ref:`local-files`).

- ``C-c C-k``: Updates the runtime JavaScript source with the contents of the
  current buffer (this is also done automatically when a buffer is saved).

You can setup a hook to be run after each script update. For example ::

  (add-hook 'indium-update-script-source-hook
	  (lambda (url)
	    (indium-eval (format "window.dispatchEvent(new CustomEvent('patch', {detail: {url: '%s'}}))"
				 url))))

Then you can use it in your app for development purposes ::

  window.addEventListener("patch", (event) => {
    console.log("Patched @ " + new Date().toTimeString().substring(0, 8), event.detail.url);
    // rerender, etc
  });
