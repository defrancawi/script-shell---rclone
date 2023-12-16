rclone sync "X:\BKP - NUVEM" gdrive:NOME_DRIVER --log-file "C:\rclone\log_bkp\Log.txt" --stats-log-level NOTICE 


powershell.exe -command "& 'C:\rclone\AnaliseLog.ps1'"
powershell.exe -command "& 'C:\rclone\retencao.ps1'"








