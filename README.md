# ruko's home manager config

This includes some configuration for xmonad and kitty.

## Installation

Clone this repo to ~/.config/nixpkgs to configure home manager.

You need to install home manager first for this to work. I installed it by
going to https://github.com/nix-community/home-manager and following the
installation instructions there. In particular, I ran these commands:

```
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update
```

and then I had to log out and back in to make the channel available. Then I
ran this command to install home manager:

```
$ nix-shell '<home-manager>' -A install
```

After updating your config, you can run `home-manager switch` to make it take
effect. What this does is generate home configuration files from the nix
code you wrote and create symlinks in your home config directory pointing to
those generated files in the nix store.
