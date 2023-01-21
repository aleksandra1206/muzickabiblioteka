<?php

$artists[] = 'Post Malone';
$artists[] = 'Dua Lipa';
$artists[] = 'Travis Scott';
$artists[] = 'Madonna';
$artists[] = 'Labrinth';
$artists[] = 'Cascada';
$artists[] = 'Indila';
$artists[] = 'Guns N Roses';
$artists[] = 'Tame Impala';
$artists[] = 'Hippie Sabotage';


$query = $_REQUEST['query'];
$suggestion = ""; 

if ($query !== "") {
    $query = strtolower($query);
    $length = strlen($query);

    foreach ($artists as $artist) {
        if (stristr($query, substr($artist, 0, $length))) {
            if ($suggestion == "") {
                $suggestion = $artist;
            } else {
                $suggestion .= ", $artist";
            }
        }
    }
}
if ($suggestion == "") {
    echo 'No suggestions';
} else {
    echo $suggestion;
}
