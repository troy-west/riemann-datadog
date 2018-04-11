#!/usr/bin/env bash
set -euxo

RPM=jre-8u161-linux-x64.rpm
POLICY_ZIP=jce_policy-8.zip
JRE_8_RPM_URL="http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/${RPM}"
POLICY_ZIP_URL=http://download.oracle.com/otn-pub/java/jce/8/${POLICY_ZIP}
export JAVA_HOME=/usr/java/jre1.8.0_161

curl -C - -LR\#OH "Cookie: oraclelicense=accept-securebackup-cookie" -k "${JRE_8_RPM_URL}"

yum localinstall -y ${RPM}
yum install -y unzip

curl -C - -LR\#OH "Cookie: oraclelicense=accept-securebackup-cookie" -k ${POLICY_ZIP_URL}

unzip ${POLICY_ZIP}

if [ -z "$(grep JAVA_HOME /etc/profile)" ]; then
    echo "export JAVA_HOME=$JAVA_HOME" | tee -a /etc/profile
    echo 'export PATH=$PATH:$JAVA_HOME/bin' | tee -a /etc/profile
fi

if [ ! -e "./UnlimitedJCEPolicyJDK8" ]; then
    echo "Could not find JCE directory"
    exit 1
fi

yes | cp -prf ./UnlimitedJCEPolicyJDK8/*.jar "$JAVA_HOME/lib/security"
