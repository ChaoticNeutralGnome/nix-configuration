{ pkgs, ... }: {
        rust = pkgs.mkShell {
            buildInputs = with pkgs; [
                openssl
                pkg-config
                rust-bin.beta.latest.default
            ];
        };
}