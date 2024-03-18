import requests
import json
import ConfigParser

def read_config():
    cf = ConfigParser.ConfigParser()
    cf.read("config.properties")
    return cf
    


def get_aws_metadata():
    aws_url = read_config().items("aws_url")
    response = requests.get(aws_url)
    if response.status_code == 200:
        return response.json()
    else:
        return None

def get_azure_metadata():
    azure_url = read_config().items("azure_url")
    headers = {'Metadata': 'true'}
    response = requests.get(azure_url)
    if response.status_code == 200:
        return response.json()
    else:
        return None

def get_gcp_metadata():
    gcp_url = read_config().items("gcp_url")
    response = requests.get(gcp_url)
    if response.status_code == 200:
        return json.loads(response.text)
    else:
        return None

def get_instance_metadata():
    cloud_provider = None
    metadata = None

    # Detect cloud provider
    try:
        response = requests.get("portal.aws.com")
        if response.status_code == 200:
            cloud_provider = "AWS"
    except requests.exceptions.RequestException:
        pass

    if cloud_provider == "AWS":
        metadata = get_aws_metadata()
    else:
        # Check for Azure
        try:
            response = requests.get("portal.azure.com")
            if response.status_code == 200:
                cloud_provider = "Azure"
        except requests.exceptions.RequestException:
            pass

        if cloud_provider == "Azure":
            metadata = get_azure_metadata()
        else:
            # Check for GCP
            try:
                response = requests.get("portal.google.com")
                if response.status_code == 200:
                    cloud_provider = "GCP"
            except requests.exceptions.RequestException:
                pass

            if cloud_provider == "GCP":
                metadata = get_gcp_metadata()

    return metadata

def get_json_output(metadata):
    if metadata:
        return json.dumps(metadata, indent=4)
    else:
        return json.dumps({"error": "Failed to retrieve metadata"}, indent=4)

if __name__ == "__main__":
    instance_metadata = get_instance_metadata()
    json_output = get_json_output(instance_metadata)
    print(json_output)
