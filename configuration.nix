# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };
# Enable GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sabby = {
    isNormalUser = true;
    description = "sabby";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "sabby";

  # Install firefox.
 #  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  firefox
  git
  grep
  wget
  lynx
  rsync
  htop
  yt-dlp
  ani-cli
  hugo
  hyfetch
  ventoy
  blocky
  
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

 # Enable Spice-webdav
 services.spice-webdavd.enable = true;
 # Enable Flatpak
 services.flatpak.enable = true;

 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 services.flatpak.packages = [
  #{ appId = "com.brave.Browser"; origin = "flathub";  }
  #"com.obsproject.Studio"
  #"im.riot.Riot"
  #gnome
 "io.github.celluloid_player.Celluloid"
 "de.haeckerfelix.Shortwave"
 "org.gnome.gitlab.YaLTeR.VideoTrimmer"
 "org.gnome.Decibels"
 "org.gnome.Boxes"
 "com.github.flxzt.rnote"
 "info.febvre.Komikku"
 "io.gitlab.news_flash.NewsFlash"
 "io.frama.tractor.carburetor"
 "com.github.johnfactotum.Foliate"
 "com.belmoussaoui.Authenticator"
 "com.mattjakeman.ExtensionManager"
 "org.gnome.Papers"
 "de.haeckerfelix.Fragments"
 "io.gitlab.adhami3310.Impression"
 "com.belmoussaoui.Obfuscate"
 "app.drey.Warp"
 "de.haeckerfelix.AudioSharing"
 "com.usebottles.bottles"
 "app.fotema.Fotema"
 "com.hunterwittenborn.Celeste"
 "org.gnome.SoundRecorder"
 "org.gnome.FileRoller"
 "app.drey.Dialect"
 "garden.jamie.Morphosis"
 "com.github.unrud.VideoDownloader"
 "de.leopoldluley.Clapgrep"
 "io.github.nokse22.asciidraw"
 "com.github.tchx84.Flatseal"
#kde
 "org.kde.krita"
 "org.kde.kdenlive"
 "org.kde.ark"
#others
 "io.github.zen_browser.zen"
 "org.chromium.Chromium"
 "org.mozilla.Thunderbird"
 "org.gimp.GIMP"
 "org.inkscape.Inkscape"
 "org.libreoffice.LibreOffice"
 "com.obsproject.Studio"

  ];
}
