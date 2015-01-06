open Core.Std

type t = { decode_s : string; tag_s : string }

let ccm = {
  decode_s =
    "INI2 DUP DUP FIN2 TBC MSG2 XOR DUP OUT2 SWAP TBC MSG1 XOR DUP OUT1 INI1 XOR TBC XOR TBC FIN1";
  tag_s =
    "INI1 TBC OUT1 INI2"
}

let copa = {
  decode_s =
    "MSG1 TBC INI2 XOR DUP TBC DUP OUT1 INI1 XOR SWAP MSG2 TBC XOR DUP FIN2 TBC DUP OUT2 XOR FIN1";
  tag_s =
    "INI1 TBC INI2 XOR TBC OUT1"
}

let ocb = {
  decode_s =
    "INI1 INI2 FIN2 MSG1 TBC DUP OUT1 XOR MSG2 TBC DUP OUT2 XOR FIN1";
  tag_s =
    "INI1 TBC OUT1 INI2"
}

let otr = {
  decode_s =
    "MSG2 DUP TBC MSG1 XOR DUP DUP OUT1 INI1 XOR 2SWAP SWAP TBC XOR DUP OUT2 XOR FIN1 INI2 FIN2";
  tag_s =
    "INI1 TBC OUT1 INI2"
}

let xcbc = {
  decode_s =
    "INI1 INI2 MSG1 DUP MSG2 DUP FIN2 TBC XOR DUP OUT2 2SWAP SWAP TBC XOR DUP OUT1 2SWAP XOR XOR FIN1";
  tag_s =
    "INI1 TBC OUT1 INI2"
}

let modes =
  String.Map.of_alist_exn [
    "CCM", ccm;
    "COPA", copa;
    "OCB", ocb;
    "OTR", otr;
    "XCBC", xcbc
  ]

let create decode tag = { decode_s = decode; tag_s = tag }

let decode_string t = t.decode_s
let tag_string t = t.tag_s
