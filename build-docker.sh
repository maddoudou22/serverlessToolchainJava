#!/bin/sh
# Script utilise pour le build de l'image Docker:
# recupere en arguments 1&2 le nom et la version de l'image docker pouvant servir de cache pour la construction de l'image cible, et en argument 2 l'image de base a utiliser si l'image n'est pas accessible

cache_image_name=$1
cache_image_version=$2
dockerfile_basis=$3
region=$4
accountid=$5

if ! aws ecr list-images --region $region --registry-id $accountid --repository-name $cache_image_name | grep $cache_image_version
  then
    echo "Image cache non trouvee. Reconstruction ..."
    docker build -f $dockerfile_basis -t $accountid.dkr.ecr.$region.amazonaws.com/$cache_image_name:$cache_image_version . &
  else
    docker pull $accountid.dkr.ecr.$region.amazonaws.com/$cache_image_name:$cache_image_version &
	echo "Image cache trouvee. Telechargement ..."
fi
