<?php
include('functions.php');

// 入力チェック
if (
  !isset($_POST['task']) || $_POST['task'] == '' ||
  !isset($_POST['deadline']) || $_POST['deadline'] == ''
) {
    exit('ParamError');
}

//POSTデータ取得
$task = $_POST['task'];
$deadline = $_POST['deadline'];
$comment = $_POST['comment'];

// Fileアップロードチェック
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



// DB接続
$pdo = db_conn();

// データ登録SQL作成
// imageカラムとバインド変数を追加
$sql = 'INSERT INTO php02_table(id, task, deadline, comment, image, indate)
VALUES(NULL, :a1, :a2, :a3,:image, sysdate())';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':a1', $task, PDO::PARAM_STR);
$stmt->bindValue(':a2', $deadline, PDO::PARAM_STR);
$stmt->bindValue(':a3', $comment, PDO::PARAM_STR);
$stmt->bindValue(':image', $fileNameToSave, PDO::PARAM_STR);

// :imageを$file_nameで追加！
$status = $stmt->execute();

//データ登録処理後
if ($status == false) {
    showSqlErrorMsg($stmt);
} else {
    //index.phpへリダイレクト
    header('Location: index.php');
}
