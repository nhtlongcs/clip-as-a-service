## CLIP-as-a-Service

A Minimal Embedding Framework for Extracting Embeddings for Images and Sentences with CLIP. It simplifies the process of embedding extraction, providing ready-to-use functions for both batch and single-instance embedding tasks. The framework eliminates the need for extensive technical expertise, making it accessible to a wider range of users.

## Getting Started with CLIP-as-a-service

Here's how to get CLIP-as-a-service up and running for both production and development environments:

**For Production:**

```bash
$ cd this-repo # Navigate to the project directory:
# Configure your environment settings by renaming the `.env.dev` file to `.env`.
$ sh tools/build.sh # Build the service
$ sh tools/start_svc.sh # Start the service
```
Once the service is running, you can interact with it using REST APIs.

**For Development:**

```bash
# Follow steps 1 and 2 from the production setup.
$ sh tools/dev_docker.sh # Start the development environment using Docker
# The above line will mount your local environment within a Docker container.
# After entering the container, initiate development using `tmux` and the provided script
$ tmux
$ sh tools/serve_manually.sh
```

### Documentation

Here are some illustrative examples of using _CLIP-as-a-service_:

<table>
<tr>
<td> via HTTP </td>
<td> via python </td>
</tr>
<tr>
<td>

```bash
curl -X 'POST' \
'http://localhost:{CLIP_PORT}/api/text/' \
-H 'accept: application/json' \
-H 'Content-Type: application/json' \
-d '{
"text": "a man with a white hat"
}'
```

</td>
<td>

```python
import request
url = f"http://localhost:{CLIP_PORT}/api/text/"
response = requests.post(url, json={"text": text})
response = response.json() 
```

</td>
</tr>

<tr>
<td>

```bash
curl -X 'POST' \
'http://localhost:{CLIP_PORT}/api/image' \
-H 'accept: application/json' \
-H 'Content-Type: multipart/form-data' \
-F 'data=@IMG.png;type=image/png'
```
</td>
<td>

```python
import request
url = f"http://localhost:{CLIP_PORT}/api/image/"
response = requests.post(url=url, files=[('data', open(filepath, 'rb'))])
response = response.json() 
```
</td>
</tr>
<tr>
<td>

```bash
curl -X 'POST' \
'http://localhost:{CLIP_PORT}/api/image/url' \
-H 'accept: application/json' \
-H 'Content-Type: application/json' \
-d '{
  "url": "https://res.cloudinary.com/demo/basketball_shot.jpg"
}'
```

</td>
<td>

```python
import request
image_url = 'https://res.cloudinary.com/demo/basketball_shot.jpg'
url = f"http://localhost:{CLIP_PORT}/api/image/url/"
response = requests.post(url, json={"url": image_url})
response = response.json() 
```

</td>
</tr>
</table>

We also offer a batch mode for rapid processing of multiple items. For more details, please refer to the Swagger documentation at `http://localhost:{CLIP_PORT}/docs`.

## Key Features

**Ready-to-Use Functions**: _CLIP-as-a-service_ eliminates the need for complex code or intricate model configurations. It provides ready-to-use functions for both batch and single-instance embedding tasks, simplifying the process of embedding extraction.

**HTTPS Connection with FastAPI**: _CLIP-as-a-service_ supports HTTPS connections, enabling secure communication with your HTTP client of choice. This ensures the confidentiality and integrity of data during embedding extraction.

**Easy Scalability with Docker**: _CLIP-as-a-service_ can be seamlessly scaled using Docker containers, making it suitable for handling large workloads efficiently. This allows for effortless deployment and management of embedding extraction tasks.

**GPU Support for Enhanced Performance**: _CLIP-as-a-service_ supports GPU acceleration, leveraging the computational power of GPUs to significantly improve embedding extraction performance. This is particularly beneficial for large-scale embedding tasks.

## Applications

_CLIP-as-a-service_ finds its application in various domains, including:

**ReID (Person Re-identification)**: _CLIP-as-a-service_ can be used to extract embeddings for person images, enabling accurate re-identification of individuals across different camera views.

**Semantic Content Retrieval**: _CLIP-as-a-service_ facilitates image retrieval tasks by extracting embeddings that capture semantic similarities between images. This enables efficient retrieval of relevant images based on a query image.

## Conclusion

_CLIP-as-a-service_ stands out as a user-friendly embedding framework, providing a seamless experience for extracting embeddings from images and sentences. Its ready-to-use functions, HTTPS connectivity, strong community support, easy scalability, and GPU support make it an invaluable tool for a wide range of applications, including reID systems, image retrieval, image captioning, text summarization, and question answering.

## Acknowledgments

- Original work [OpenAI CLIP]()
- Inspired by [Jina AI: Clip-as-Service]()
