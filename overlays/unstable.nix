{inputs }:

final: prev: {
    unstable = import inputs.pkgs-unstable {
        system = prev.system;
        config = prev.config;
    };
}