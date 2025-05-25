import boto3

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = event['detail']['resourceId']

    try:
        s3.put_bucket_encryption(
            Bucket=bucket_name,
            ServerSideEncryptionConfiguration={
                'Rules': [{
                    'ApplyServerSideEncryptionByDefault': {
                        'SSEAlgorithm': 'AES256'
                    }
                }]
            }
        )
        return {
            'status': 'Encryption applied',
            'bucket': bucket_name
        }
    except Exception as e:
        return {
            'status': 'Failed',
            'error': str(e)
        }
