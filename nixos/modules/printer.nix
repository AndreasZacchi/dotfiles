{ pkgs, ... }:

let
  myPrintPpd = pkgs.runCommand "myprint-ppd" { } ''
    install -Dm444 ${./myPrint_PS.ppd} $out/share/cups/model/myPrint_PS.ppd
  '';
in
{
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.brlaser
    myPrintPpd
  ];

  hardware.printers = {
    ensurePrinters = [
      {
        name = "myPrint";
        location = "School printer";
        deviceUri = "https://print.nextkbh.dk/RicohmyPrint/printers/ipp/print";

        model = "myPrint_PS.ppd";

        ppdOptions = {
          "auth-info-required" = "username,password";
        };
      }
    ];

    ensureDefaultPrinter = "myPrint";
  };
}
