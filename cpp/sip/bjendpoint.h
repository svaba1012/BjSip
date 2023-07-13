#ifndef BJENDPOINT_H
#define BJENDPOINT_H

#include <pjsua2.hpp>
#include <iostream>

using namespace pj;

class BjEndpoint : public Endpoint{
public:
    BjEndpoint();
    virtual pj_status_t onCredAuth(OnCredAuthParam &prm){
        PJ_UNUSED_ARG(prm);
        std::cout << "*** Callback onCredAuth called ***" << std::endl;
        /* Return PJ_ENOTSUP to use
         * pjsip_auth_create_aka_response()/<b>libmilenage</b> (default),
         * if PJSIP_HAS_DIGEST_AKA_AUTH is defined.
         */
        return PJ_ENOTSUP;
    }
};

#endif // BJENDPOINT_H


