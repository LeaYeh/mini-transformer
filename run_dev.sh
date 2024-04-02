docker build -t pytorch-jupyter-notebook .
docker run -it --rm -p 8888:8888 -v .:/home/jovyan/work pytorch-jupyter-notebook start-notebook.sh --NotebookApp.token='' --NotebookApp.password=''