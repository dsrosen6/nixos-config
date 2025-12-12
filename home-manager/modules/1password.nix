{ pkgs, ... }:
{
  # 1Password is installed via a NixOS package because the home manager version doesn't
  # work with the browser extension. That is why it's not installed here.
  #
  # This service keeps 1Password running in silent mode which makes for
  # faster use of quick-access.
  systemd.user.services."1password" = {
    Unit = {
      Description = "1Password";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs._1password-gui}/bin/1password --silent";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

}
