# Installing custom cat-images HTML error pages on Linux-based Apache2 web server

```
git clone https://github.com/michaelmouton/cat-images
cd cat-images
```

```
chmod +x script.sh
./script.sh
```

```
sudo cp -r ./output/html /var/www/cat-images
sudo cp ./output/cat-images.conf /etc/apache2/conf-available/cat-images.conf
```

```
sudo a2enconf cat-images
sudo systemctl reload apache2
```

Special thanks to [httpcats](https://github.com/httpcats/http.cat) and [tarampampam](https://github.com/tarampampam/error-pages)!
