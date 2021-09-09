import yaml

if __name__ == '__main__':
    stream = open("test.yaml", "r")

    dicionario = yaml.safe_load(stream)
    for key, value in dicionario.items():
        print(key+" : "+str(value))
