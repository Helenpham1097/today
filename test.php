  <?php

  $path = $argv[1] ?? '';

  if ($path === '') {
      fwrite(STDERR, "Usage: php chmod_fix.php <path>\n");
      exit(1);
  }

  $real_path = realpath($path);
  
  if ($real_path === false) {
      fwrite(STDERR, "Path not found: $path\n");
      exit(1);
  }

  $iterator = new RecursiveIteratorIterator(
      new RecursiveDirectoryIterator($real_path, RecursiveDirectoryIterator::SKIP_DOTS),
      RecursiveIteratorIterator::SELF_FIRST
  );

  foreach ($iterator as $item) {
      if ($item->isDir()) {
          chmod($item->getPathname(), 0550);
      } else {
          chmod($item->getPathname(), 0644);
      }
  }

  chmod($real_path, 0550);

  echo "Done\n";

