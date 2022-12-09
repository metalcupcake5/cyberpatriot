(
    ## pictures
    find ./ -name "*.png" -type f;
    find ./ -name "*.jpg" -type f;
    find ./ -name "*.jpeg" -type f;
    find ./ -name "*.gif" -type f;

    ## video
    find ./ -name "*.mp4" -type f;
    find ./ -name "*.mov" -type f;
    find ./ -name "*.webm" -type f;

    ## audio
    find ./ -name "*.mp3" -type f;
    find ./ -name "*.wav" -type f;

    ## others
    find ./ -name "*.txt" -type f;
    find ./ -name "*.zip" -type f;
    find ./ -name "*.rar" -type f;
    find ./ -name "*.tar.gz" -type f;
    find ./ -name "*.php" -type f;
    find ./ -name "*backdoor*.*" -type f;
) | tee find.txt | grep -v "/\."
