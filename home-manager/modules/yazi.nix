{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    settings = {
      mgr = {
        sort_by = "alphabetical";
        sort_dir_first = true;
        sort_reverse = false;
      };
    };
  };
}
