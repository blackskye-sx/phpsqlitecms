<!DOCTYPE html>
<html lang="<?php echo $lang['lang']; ?>" dir="<?php echo $lang['dir']; ?>">
<head>
    <meta charset="<?php echo $lang['charset']; ?>"/>
    <title><?php if ($page_title): ?><?php echo $page_title; ?><?php else: ?><?php if ($title): ?><?php echo $title; ?> - <?php endif; ?><?php echo $settings['website_title']; ?><?php endif; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?php if ($description) echo $description; else echo $settings['default_description']; ?>">
    <meta name="keywords" content="<?php if ($keywords) echo $keywords; else echo $settings['default_keywords']; ?>">
    <meta name="generator" content="phpSQLiteCMS <?php echo $settings['version']; ?>">
    <link href="<?php echo BOOTSTRAP_CSS; ?>" rel="stylesheet">
    <link href="<?php echo STATIC_URL; ?>css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="<?php echo STATIC_URL; ?>img/favicon.png">

<?php include(BASE_PATH . 'cms/templates/subtemplates/fonts.inc.tpl'); ?>

</head>

<body<?php if ($admin): ?> class="admin"<?php endif; ?>>
<?php if ($admin) include(BASE_PATH . 'cms/templates/admin/subtemplates/admin_menu.inc.tpl'); ?>

<div class="container">

    <header class="header">
        <div class="row">
            <div class="col-md-4 logo-wrapper">
                <h1 id="logo"><a href="<?php echo BASE_URL; ?>"><?php echo $settings['website_title']; ?></a></h1>
            </div>
            <a id="menu-toggle-handle" href="#" class="visible-xs"><span class="icon-bar"></span>
                <span class="icon-bar"></span><span class="icon-bar"></span></a>
            <nav id="nav" class="col-md-8">
                <?php if ($menu_1 && isset($menus[$menu_1])): ?>
                    <ul class="nav nav-pills">
                        <?php foreach ($menus[$menu_1] as $item): ?>
                            <li<?php if (!empty($item['section']) && $item['section'] == $section[0]): ?> class="active"<?php endif; ?>>
                            <a href="<?php echo $item['link']; ?>"
                               title="<?php echo $item['title']; ?>"<?php if ($item['accesskey'] != ''): ?> accesskey="<?php echo $item['accesskey']; ?>"<?php endif; ?>><?php echo $item['name']; ?></a>
                            </li><?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </nav>
        </div>
    </header>

    <?php if ($sidebar_1): ?>
        <?php echo $sidebar_1; ?>
    <?php endif; ?>

    <?php if ($breadcrumbs): ?>
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo BASE_URL . $breadcrumb['page']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
            <?php endforeach; ?>
            <li class="active"><?php echo $title; ?></li>
        </ul>
    <?php endif; ?>

    <?php if (empty($sidebar_1) && empty($breadcrumbs)): ?>
        <hr class="topsep hidden-xs">
    <?php endif; ?>

    <div class="body-content">

        <div class="row<?php if (isset($tv['nocolumns'])): ?> main-content<?php endif; ?>">
<?php 
// template veriable : nocolumns = row main-content 
// else col-md-5 main-content 
?>
            <?php if (empty($tv['nocolumns'])): ?>
            <div class="col-md-9 main-content">
                <?php endif; ?>

                <?php if (empty($hide_content)) echo $content; ?>
                <?php if (isset($subtemplate)) include(BASE_PATH . 'cms/templates/subtemplates/' . $subtemplate); ?>

            </div>


<?php 
// consider making this an array 
// 
?>
            <?php if (($sidebar_2) && ( 
                        ( $_SERVER['REMOTE_ADDR'] == $settings['my_secure_ip0'] ) 
                        || 
                        ( $_SERVER['REMOTE_ADDR'] == $settings['my_secure_ip1'] )
                        ||
                        ($admin)
                            ) ): ?>
                <div class="col-md-3 sidebar">
                    <?php echo $sidebar_2; ?>
                    <?php //echo $_SERVER['REMOTE_ADDR'] ; ?>
                </div>
            <?php endif; ?>

            <?php if (empty($tv['nocolumns'])): ?>
        </div>
        <?php endif; ?>

    </div>

    <?php if ($sidebar_3): ?>
        <?php echo $sidebar_3; ?>
<?php //<br>xxx ?>
<?php //echo $section[0]; ?>
<?php //zzz<br> ?>
    <?php endif; ?>

    <hr class="closure">

    <footer class="row footer">
<div class="row">
        <div class="col-md-4">
	<p class="text-left">
	&xi;</p>
	</div>
	<div class="col-md-4">

            <?php if ($gcb_1 && isset($gcb[$gcb_1])): ?>
                <?php echo $gcb[$gcb_1]; ?>
            <?php else: ?>
                <p>&copy; <?php echo date("Y"); ?> 
			<?php echo $settings['author']; ?>
			<?php if ($type != 'news' && $type != 'search' && $type != 'notes'): ?>
                        <br/><?php echo $lang['page_last_modified']; ?><?php endif; ?>
			<br/>Powered by
                    	<a href="http://phpsqlitecms.net">phpSQLiteCMS</a></p>
            <?php endif; ?>
        </div>
	<div class="col-md-2"> &nbsp; </div>
	<div class="col-md-2">
		<?php if ($gcb_2 && isset($gcb[$gcb_2])): ?>
                	<?php echo $gcb[$gcb_2]; ?>
		<?php endif; ?>
	</div>
</div>
    </footer>

</div>

<script src="<?php echo JQUERY; ?>"></script>
<script src="<?php echo BOOTSTRAP; ?>"></script>
<script src="<?php echo STATIC_URL; ?>js/main.js"></script>
<?php if ($admin): ?>
    <script src="<?php echo STATIC_URL; ?>js/admin_frontend.js"></script>
<?php endif; ?>
<?php if (isset($contains_thumbnails)): ?>
    <script src="<?php echo STATIC_URL; ?>js/mylightbox.js" type="text/javascript"></script>
<?php endif; ?>
</body>
</html>

