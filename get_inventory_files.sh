# Example usage
#
# get_inventory_files Company file_type
# get_inventory_files Apple hostnames
# get_inventory_files Snapchat urls | tee snap_urls.txt
#
#
# File types: hostnames, servers, spider, urls, and cloud

get_inventory_files() {
    company=$1
    file=$2

    BASE_URL="https://raw.githubusercontent.com/trickest/inventory/main"

    wget -q -O - "${BASE_URL}/${company}/${file}.txt"
    i=0
    while wget -q -O - "${BASE_URL}/${company}/${file}_$(printf '%02d' $i).txt"; do
        i=$((i+1))
    done
}
