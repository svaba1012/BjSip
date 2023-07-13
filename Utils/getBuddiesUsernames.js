
function getBuddiesUsernames(buddies, maxNum) {
    let usernamesStr = buddies.filter((buddy, i) => i < maxNum).reduce((acc, buddy, i, arr) =>{
        if(i === arr.length - 1){
            return acc + buddy.contact_name;
        }
        if(i === arr.length - 2 && buddies.length <= maxNum){
            return acc + buddy.contact_name + " and ";
        }
        return acc + buddy.contact_name + ", ";
    }, "")
    let moreStr = "";
    if(buddies.length > maxNum){
        moreStr = ` and ${buddies.length - avatarGroup.maxNum} more`;
    }
    return usernamesStr + moreStr
}
