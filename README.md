# rust-rag
Testing out different RAG approaches on https://doc.rust-lang.org/stable/book/

# Data 
The data used was taken from a local installation of Rust. You can find where this is located by running `rustup doc` to open the local docs in a browser and follow the file path. In my case it was `$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/doc/rust/html/book/`. 

Copy this folder to this project. Next delete the older versions of the book that are stored under the `2018-edition/`, `first-edition/` and `second-edition`. This will remove older documentation that will severely affect the performance of your rag system.

Finally, run `./src/convert_html_to_txt.sh` to convert the HTML files to plain text. The plain text files will be used to establish the vector database.


# Setup

On Linux:

1) Install [pyenv](https://github.com/pyenv/pyenv)
2) Install Python 3.11 and switch to it
```
pyenv install 3.11
pyenv global 3.11
```
3) Install [poetry](https://python-poetry.org/docs/)
4) Activate your environment and have fun!
```
poetry init
poetry install
```
