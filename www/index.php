<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to Docker PHP Development Image</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#accordion" ).accordion({
                heightStyle: "content",
                collapsible: true
            });
        } );
    </script>
</head>
<body>
    <div class="container">
        <div class="hero">
            <h1 class="name">
                <strong>PHP</strong> Development Image
            </h1>
            <div id="accordion">
                <?php foreach ($info as $cat => $val) { ?>
                    <h2 class="section-title"><?php echo $cat ?></h2>
                    <div>
                        <?php foreach($val as $k => $v) { ?>
                            <div class="list-card">
                                <span class="exp"><?php echo $k ?></span>
                                <div>
                                    <span><?php echo $v ?></span>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <?php
        function phpinfo_array() {
            ob_start();
            phpinfo();
            $info_arr = array();
            $info_lines = explode("\n", strip_tags(ob_get_clean(), "<tr><td><h2>"));
            $cat = "General";
            foreach($info_lines as $line) {
                // new cat?
                preg_match("~<h2>(.*)</h2>~", $line, $title) ? $cat = $title[1] : null;
                if(preg_match("~<tr><td[^>]+>([^<]*)</td><td[^>]+>([^<]*)</td></tr>~", $line, $val)) {
                    $info_arr[$cat][$val[1]] = $val[2];
                } elseif(preg_match("~<tr><td[^>]+>([^<]*)</td><td[^>]+>([^<]*)</td><td[^>]+>([^<]*)</td></tr>~", $line, $val)) {
                    $info_arr[$cat][$val[1]] = array("local" => $val[2], "master" => $val[3]);
                }
            }
            return $info_arr;
        }
    ?>
</body>
</html>