# Anaconda(python), R, rpy2, install Dockerfile.

This Dockerfile install Anaconda, R, rpy2 and other python and r packages. 

# Usage 
```
docker build -f ./Dockerfile -t <image_name> . 
docker image ls 
docker container run -it -p 8888:8888 --name <container_name> --mount type=bind,src=`pwd`,dst=/workdir <image_name>
``` 

`jpt_lab` bash alias activate jupyter lab. 


# Snippets 
If you want to add snippets, docker container path is `/root/.local/share/jupyter`
then type, 
```
docker container run -it -p 8888:8888 --name <container_name> --mount type=bind,src=`pwd`,dst=/workdir --mount type=bind,src=<host_snippet_path>,dst=/root/.local/share/jupyter <image_name>
```


If you want to use kite autocompletion, type the following, 
```
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)" 
pip install "jupyter-kite<2.0.0" 
jupyter labextension install "@kiteco/jupyterlab-kite" 
```



