if [ ! -d "$HOME/google-cloud-sdk"  ]; then
  print "'google-cloud-sdk' folder not found. Please install 'gcloud' before using this plugin."
  return 0
else
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

  # The next line enables shell command completion for gcloud.
  if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

  alias gcauth='gcloud auth login'
  alias gcauthapp='gcloud auth application-default login'
fi