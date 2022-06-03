# i3-config.d

A simple script that creates a `config.d` directory which will contain the i3 sections of i3 configuration. This allows configurations to be split into smaller files that can be related to certain applications or sets of configuration. Beyond making the configurations easier to manage, this allows a lot of flexability and control when it comes to adding and sharing configuration snippets. Configuration snippets can be shared as files online and put into a single file within the `config.d` directory. They can also be synchronised between machines and tools such as [shared-config-init](https://github.com/flungo/shared-config-init) can be used to load the relevant configurations for the machine.

## How it works?

Running the `config-init` script will search the `config.d` subdirectory of the i3 configration folder (typically `~/.config/i3/config.d`) for files ending `.conf` and concattenate them together in lexilogical order into one configuration file stored in the standard i3 configuration location (typically `~/.config/i3/config`). The script can be run manually, or integrated as part of your `xinit` process (see [hooks](#hooks) to see how to integrate).
