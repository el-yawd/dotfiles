{
  pkgs,
  ...
}:

{
  programs.steam = {
    enable = true;
  };

  # Ensure 32-bit OpenGL drivers are available (required by Steam)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
