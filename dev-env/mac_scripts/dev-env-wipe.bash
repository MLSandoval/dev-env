compose_file_path="$HOME/dev-env/dev-env/docker/docker-compose.yml"

echo "Do you wish to remove all saved data from this Docker image [dev_env]?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) docker-compose -f $compose_file_path down; break;;
        No ) exit;;
    esac
done
