/* Optionales Include fuer Component.LBaseLI_File.opt.m4 */
/* Datei in *.m4 editieren, mit mc.sh nach *.mc konvertieren */

#define GETENV_FORMAT(FELD,IDENTIFIER,DEFAULT_VALUE)\
FELD = @getenv(_ref_stable(`IDENTIFIER´));\
l_ausgabe =  _addhk_stable(`FELD´) || " = GETENV_FORMAT(" || _ref_stable(`IDENTIFIER´) || ") -> (" || @getwert(FELD,FALSE) || ")";\
ifelse(`DEFAULT_VALUE´,`´,`´,`if(@getwert(FELD,FALSE) <= "") { FELD=_ref_stable(`DEFAULT_VALUE´); l_ausgabe = l_ausgabe || " ->DEFAULT-> (" || @getwert(FELD) || ")";}´)\
@print(l_ausgabe);

#define FOPEN_FORMAT(FILENAME,MODE,ENCODING, ABBRUCHMELD)\
@save_vars(l_fd, l_filename, l_mode, l_encoding, l_abbruch, l_eof);\
l_filename = _ref_stable(`FILENAME´);\
l_mode = _addhk_stable(`MODE´);\
l_encoding = ifelse(`ENCODING´,`´,"",_ref_stable(`ENCODING´));\
if (l_encoding == "UTF-8-BOM") { l_encoding = "utf-8"; l_bom = "UTF-8";}\
l_abbruch = _ref_stable(`ABBRUCHMELD´);\
l_rc = @fopen(l_filename, l_mode, l_encoding);\
l_fd = l_rc;\
l_eof = 0;\
@print("FOPEN_FORMAT(" || l_filename || "," || l_mode || "," || l_encoding || ") -> (" || l_fd || ")");\
if (l_fd+0 <= 0) {\
    l_mesg = @sprintf("fopen(#l_filename, #l_mode, #l_encoding) -> #l_rc");\
    if (l_abbruch == "Y") {\
	@abort(l_mesg);\
    } else {\
	if (l_abbruch == "D") {\
	    @meldung(l_mesg);\
	} else { \
	    @print(l_mesg);\
	}\
    }\
}\
while (l_fd+0 > 0) { \
    if (l_bom == "UTF-8" & (l_mode == "a" | l_mode == "w")) {\
	l_bom = "";\
	l_temp = @chr(65279);\
	FPUTS_FORMAT(l_temp)\
    }


#define FPUTS_FORMAT(TEXT)\
l_text = _ref_stable(`TEXT´);\
l_rc = @fputs(l_text, l_fd);\
l_eof = 0;\
@print("FPUTS_FORMAT(" || l_text || "," || l_fd || ") -> (" || l_rc || ")");\
if (l_rc+0 < 0) {\
    l_mesg = @sprintf("fputs(#l_text, #l_fd) -> #l_rc");\
    if (l_abbruch == "Y") {\
	@abort(l_mesg);\
    } else {\
	if (l_abbruch == "D") {\
	    @meldung(l_mesg);\
	} else { \
	    @print(l_mesg);\
	}\
	break;\
    }\
}

#define FGETS_FORMAT(IDENTIFIER,RMNL)\
l_rmnl = ifelse(`RMNL´,`´,"N",_ref_stable(`RMNL´));\
l_rc = @fgets(IDENTIFIER, l_fd);\
l_pos = @pos(@getwert(IDENTIFIER),@chr(10)); \
if (l_rmnl == "Y" & l_pos+0 > 0) { IDENTIFIER = @substr (IDENTIFIER,1,l_pos-1); } \
l_eof = l_rc;\
@print("FGETS_FORMAT(" || _addhk_stable(`IDENTIFIER´) || "," || l_rmnl || "," || l_fd || ") -> (" || l_rc || ") -> (" || @getwert(`IDENTIFIER´) || ")");\
if (l_rc+0 < 0) {\
    l_mesg = @sprintf("fputs(#l_text, #l_fd) -> #l_rc");\
    if (l_abbruch == "Y") {\
	@abort(l_mesg);\
    } else {\
	if (l_abbruch == "D") {\
	    @meldung(l_mesg);\
	} else { \
	    @print(l_mesg);\
	}\
	break;\
    }\
}

#define FCLOSE_FORMAT \
if (l_eof+0 == 0) {\
    break;\
}\
}\
if (l_fd+0 > 0) {\
    l_rc = @fclose(l_fd);\
    if (l_rc+0 != 0) {\
	if (l_abbruch == "Y") {\
	    @abort(@sprintf("fclose(#l_fd) -> #l_rc"));\
	} else {\
	    if (l_abbruch == "D") {\
		@meldung(@sprintf("fclose(#l_fd) -> #l_rc"));\
	    }\
	}\
    }\
}\
@print("FCLOSE_FORMAT(" || l_fd || ") -> (" || l_rc || ")");\
@restore_vars();

#define DIR_BEGIN_FORMA(DIRNAME,FILTER, ABBRUCHMELD)\
@save_vars(l_tempdir, l_sql, l_tempfile, l_tempdir, l_cmd, l_rc, l_dirname, l_filter, TEXT, ANZAHL);\
ANZAHL=0; \
l_dirname = ifelse(`DIRNAME´,`´,"",_ref_stable(`DIRNAME´));\
l_filter = ifelse(`FILTER´,`´,".*",_ref_stable(`FILTER´));\
l_tempdir = @getenv("TF_TEMP"); \
if (l_tempdir <= "") { \
    l_tempdir = "/tmp"; \
} \
@print("DIR_BEGIN_FORMA(" || l_dirname || ", " || l_filter || ")");\
while (TRUE == TRUE) { \
    l_sql = "SELECT dbms_random.string('x',16) FROM dual into :l_tempfile"; \
    @SqlImmediate(l_sql); \
    l_tempfile = l_tempdir || "/li_lsdir" || l_tempfile; \
    l_cmd = "( set -o noclobber ; > " || l_tempfile || " ) 2> /dev/null"; \
    l_rc = @system(l_cmd); \
    if (l_rc+0 == 0) { \
	break; \
    } \
    @print("File: (" || l_tempfile || ") already exists - try next one"); \
} \
l_cmd = "command ls -p " || l_dirname || " | grep '^" || l_filter || "$' > " || l_tempfile; \
l_rc = @system(l_cmd); \
if (l_rc+0 != 0) { \
    l_mesg = @sprintf("(#l_cmd) -> #l_rc");\
    if (l_abbruch == "Y") {\
	@abort(l_mesg);\
    } else {\
	if (l_abbruch == "D") {\
	    @meldung(l_mesg);\
	} else { \
	    @print(l_mesg);\
	}\
    }\
} else { \
FOPEN_FORMAT(l_tempfile,"r",,l_abbruch)\
ANZAHL = @getwert(ANZAHL) + 1; \
FGETS_FORMAT(TEXT,"Y")


#define DIR_END_FORMAT \
FCLOSE_FORMAT \
} \
l_cmd = "rm -f " || l_tempfile;\
@print(l_cmd); \
l_rc = @system(l_cmd); \
@print("DIR_END_FORMAT -> (" || l_rc || ")");\
@restore_vars(); 

#define MOVE(FROM,TARGET,COPY,ABBRUCHMELD)\
l_from = _ref_stable(`FROM´);\
l_target = _ref_stable(`TARGET´);\
l_copy = _ref_stable(`COPY´);\
l_abbruch = _ref_stable(`ABBRUCHMELD´);\
if (l_copy == "Y") { l_cmd = "cp"; } else { l_cmd = "mv"; } \
l_cmd = "command " || l_cmd || "  " || l_from || " " || l_target; \
@print("MOVE: " || l_cmd ); \
l_rc = @system(l_cmd); \
if (l_rc+0 != 0) { \
    l_mesg = @sprintf("(#l_cmd) -> #l_rc");\
    if (l_abbruch == "Y") {\
	@abort(l_mesg);\
    } else {\
	if (l_abbruch == "D") {\
	    @meldung(l_mesg);\
	} else { \
	    @print(l_mesg);\
	}\
    }\
}

