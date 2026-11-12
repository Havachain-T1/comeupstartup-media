<?php
    header("Content-Type:text/css");
    $color = '#' . $_GET['color'] . ' !important;';
?>

:root {
  --color-one: <?php echo ($color); ?>;
}