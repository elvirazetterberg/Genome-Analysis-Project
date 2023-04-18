set terminal png tiny size 800,800
set output "mummer_canu.png"
set xtics rotate ( \
 "CP038997.1" 1.0, \
 "CP038996.1" 123020.0, \
 "" 2919198 \
)
set ytics ( \
 "*tig00000003_pilon" 1.0, \
 "*tig00000009_pilon" 230648.0, \
 "tig00000005_pilon" 258872.0, \
 "tig00000001_pilon" 298888.0, \
 "*tig00000007_pilon" 3074610.0, \
 "tig00000006_pilon" 3091089.0, \
 "tig00000004_pilon" 3107144.0, \
 "tig00000011_pilon" 3124692.0, \
 "tig00000008_pilon" 3134487.0, \
 "" 3159597 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:2919198]
set yrange [1:3159597]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "mummer_canu.fplot" title "FWD" w lp ls 1, \
 "mummer_canu.rplot" title "REV" w lp ls 2
