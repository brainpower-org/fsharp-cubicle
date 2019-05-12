FROM brainpower/cubicle:code-1.939-share-1.0.125

RUN apt-get update
RUN apt-get install wget apt-transport-https gnupg ca-certificates -y
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.10/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install dotnet-sdk-2.2 fsharp -y 

RUN ext install ms-vscode.csharp
RUN ext install Ionide.Ionide-fsharp
RUN ext install paolodellepiane.fantomas-fmt
	 
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install -g fantomas-tool
