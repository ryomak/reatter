
image=gcr.io/ryomak/reatter:latest

login:
	gcloud auth login

prod:
	gcloud config set project ryomak

build:
	docker build . \
    	-t gcr.io/ryomak/reatter:latest \
    	-f Dockerfile
	docker push gcr.io/ryomak/reatter:latest

deploy: prod
	gcloud beta run deploy reatter --source . --platform managed --region asia-northeast1 --use-http2 --allow-unauthenticated