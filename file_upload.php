<?php
//Fileアップロードチェック
// var_dump($_FILES);
if (isset($_FILES['upfile']) && $_FILES['upfile']['error'] ==0) {
    // ファイルをアップロードしたときの処理
    // ①送信ファイルの情報取得
    $uploadedFilename = $_FILES['upfile']['name'];
    $tmpPathname = $_FILES['upfile']['tmp_name'];
    $fileDerectryPath ='upload/';
    

    // ②File名の準備
    $extension = pathinfo($uploadedFilename, PATHINFO_EXTENSION);
    
    $uniqueName = date('YmdHis').md5(session_id()) . "." . $extension;
    $fileNameToSave = $fileDerectryPath.$uniqueName;
    // var_dump($fileNameToSave);
    // exit();



    // ③サーバの保存領域に移動&④表示
    if (is_uploaded_file($tmpPathname)) {
        if (move_uploaded_file($tmpPathname, $fileNameToSave)) {
            chmod($fileNameToSave, 0644);
            $img = '<img src="'. $fileNameToSave . '" >';
        } else {
            $img='保存に失敗しました';
        }
    } else {
        $img = '画像が上がってないです' ;
    }
} else {
    // ファイルをアップしていないときの処理
    $img = '画像が送信されていません';
}

?>


<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FileUploadテスト</title>
</head>

<body>
    <!-- ここに画像出力！ -->
    <?=$img ?>
</body>

</html>