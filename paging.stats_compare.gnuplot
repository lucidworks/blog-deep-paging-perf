set xlabel "Page # (1000 docs per page)"
set ylabel "Req Time (seconds)"

set terminal png size 800,600 enhanced font "Helvetica,12"

# first some basic graphs with autoscalling on the axis

set key top left

set output 'test_a.png'
set title "Test A: Single Node; 785127 results; 'score desc'" noenhanced
plot "data/a_classic_stats" with errorbars title "Classic Paging", \
     "data/a_cursor_stats" with errorbars title "Strawman Cursor Paging", \
     "data/a_cursorX_stats" with errorbars title "Cursor Paging"

set output 'test_b.png'
set title "Test B: Single Node; 608273 results; 'author\_s desc, small\_i asc, medium\_i desc, large\_i asc, score asc'" noenhanced
plot "data/b_classic_stats" with errorbars title "Classic Paging", \
     "data/b_cursor_stats" with errorbars title "Strawman Cursor Paging", \
     "data/b_cursorX_stats" with errorbars title "Cursor Paging"

set output 'test_c.png'
set title "Test C: 2 Nodes, 2 Shards; 155355 results; 'score desc'" noenhanced
plot "data/c_classic_stats" with errorbars title "Classic Paging", \
     "data/c_cursor_stats" with errorbars title "Strawman Cursor Paging", \
     "data/c_cursorX_stats" with errorbars title "Cursor Paging"

# next some graphs with fixed axies for side by side comparison

set key top right

set xrange [0:1000]
set xtics 100
set mxtics 10

set yrange [0:2]
set ytics 0.2
set mytics 2

set output 'comp_test_a.png'
set title "Test A: Single Node; 785127 results; 'score desc'" noenhanced
plot "data/a_classic_stats" with errorbars title "Classic Paging", \
     "data/a_cursor_stats" with errorbars title "Strawman Cursor Paging", \
     "data/a_cursorX_stats" with errorbars title "Cursor Paging"

set output 'comp_test_b.png'
set title "Test B: Single Node; 608273 results; 'author\_s desc, small\_i asc, medium\_i desc, large\_i asc, score asc'" noenhanced
plot "data/b_classic_stats" with errorbars title "Classic Paging", \
     "data/b_cursor_stats" with errorbars title "Strawman Cursor Paging", \
     "data/b_cursorX_stats" with errorbars title "Cursor Paging"

set output 'comp_test_c.png'
set title "Test C: 2 Nodes, 2 Shards; 155355 results; 'score desc'" noenhanced
plot "data/c_classic_stats" with errorbars title "Classic Paging", \
     "data/c_cursor_stats" with errorbars title "Strawman Cursor Paging", \
     "data/c_cursorX_stats" with errorbars title "Cursor Paging"
