with import <nixpkgs> { };

let app = bundlerEnv {
    name = "jekyll-app";
    ruby = ruby_2_7;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    /* Note this file is obtained by running `bundix` (in the nix-shell). */
    gemset = ./gemset.nix;
  };
in
  mkShell {
    buildInputs = [ app bundix bundler ruby_2_7 glibcLocales ];
}
