import boto3
from botocore.exceptions import NoCredentialsError, ClientError

# s3 = boto3.client('s3')

# s3.create_bucket(Bucket='my-boto3-bucket-zhao', CreateBucketConfiguration={'LocationConstraint': 'eu-west-1'})

# s3.upload_file("C:\Users\zhaog\Pictures\applogo.png", 'my-boto3-bucket-zhao', 'applogo.png')

# s3.download_file("my-boto3-bucket-zhao", 'applogo.png', "C:\\Users\\zhaog\\Downloads\\applogo.png")

try:
    # Boto3 code that may raise exceptions
    s3 = boto3.client('s3')
    response = s3.upload_file(r"C:\Users\zhaog\Pictures\wudu.png", 'practical-bucket-1', 'wudu.png')
    
    # Process the response or perform other operations
    print('Successfully uploaded')


    

except NoCredentialsError:
    print("AWS credentials not found. Please configure your credentials.")

except ClientError as e:
    if e.response['Error']['Code'] == 'NoSuchBucket':
        print("The specified bucket does not exist.")
    else:
        print("An error occurred:", e)

except Exception as e:
    print(f'Error has occurred, {e}')