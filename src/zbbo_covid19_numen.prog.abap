REPORT zbbo_covid19_numen.

DATA text TYPE string.

START-OF-SELECTION.
  text = `Hello World!`.
  cl_demo_output=>display_data( text ).
