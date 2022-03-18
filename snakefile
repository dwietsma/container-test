
rule target:
    input:
        "proc/output.csv"

rule make_output_01:
    output:
        output_file = "proc/output.csv",
        session_info = "proc/session_info.txt"
    script:
        "scripts/make-output-01.R"
