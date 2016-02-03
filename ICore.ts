module dc {

    export module client {
        export interface getHeight {
            ():number;
        }
        export interface setUserOS {
            ():string;
        }
        export interface vendors {
            [index: number]:any;
        }
    }

    export interface config {
        debug: boolean;
    }
    //
    //export module dev {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module domready {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module eventflow {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module form {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module helper {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module modulPreloader {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module perf {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module pointer {
    //    export interface getHeight {
    //
    //    }
    //}
    //
    //export module raf {
    //    export interface getHeight {
    //
    //    }
    //}
}

export default dc;