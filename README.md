# Evaluating Min-K%++ on MIMIR benchmark

## Overview

This repo is a fork of the [MIMIR](https://github.com/iamgroot42/mimir) benchmark that we use to run exeperiments in our paper [Min-K%++: Improved Baseline for Detecting Pre-Training Data from Large Language Models](https://arxiv.org/abs/2404.02936).

❓ ***What's different from the original MIMIR code repo?***
1. At the time we ran experiments, directly following the instructions of MIMIR repo didn't work for us. We had to make some minor tweaks to make it work. We have included those changes and the exact instruction & script to reproduce the experiments in this repo. For setup, please still follow the original MIMIR repo [here](https://github.com/iamgroot42/mimir#instructions).
2. To compare upper bounds between Min-K%++ and Min-K%, in this repo we sweep over different values of k (e.g. 10, 20, ..., 100) and report the best performance for each method. In MIMIR currently a fixed default value (k=20) will be used.

💡 For a more **lightweight** implementation (less modular but easier for quick experiments), please refer to our [Min-K%++ repo](https://github.com/zjysteven/mink-plus-plus) which is based on the [WikiMIA benckmark](github.com/swj0419/detect-pretrain-code).

## Instructions
### Data
Download this data folder, [cache_100_200_1000_512](https://huggingface.co/datasets/iamgroot42/mimir/tree/main/cache_100_200_1000_512) and place it in the `cache` directory under the root.
```
cache
├── cache_100_200_1000_512
│   ├── test
│   ├── test_neighbors
│   ├── train
│   ├── train_neighbors
```

### Run Experiments
Simply run the `experiments_mink++_paper.sh`, which will evaluates all baselines (Loss, Ref, Zlib, Neighbor, Min-K%) and our proposed Min-K%++ on 7 subdomains of the MIMIR benchmark (Wikipedia, Github, Pile CC, PubMed Central, ArXiv, DM Mathematics, HackerNews) and over 5 Pythia models (160M, 1.4B, 2.8B, 6.9B, 12B). Note that Neighbor attack requires significant extra time, and we didn't actually run it for Pythia-12B. You may want to do the same by modifying `experiments_mink++_paper.sh` accordingly.

## Citation

If you find this repo useful, please consider citing our paper and the original MIMIR paper:

```bibtex
@article{zhang2024min,
  title={Min-K\%++: Improved Baseline for Detecting Pre-Training Data from Large Language Models},
  author={Zhang, Jingyang and Sun, Jingwei and Yeats, Eric and Ouyang, Yang and Kuo, Martin and Zhang, Jianyi and Yang, Hao and Li, Hai},
  journal={arXiv preprint arXiv:2404.02936},
  year={2024}
}

@article{duan2024membership,
  title={Do Membership Inference Attacks Work on Large Language Models?}, 
  author={Michael Duan and Anshuman Suri and Niloofar Mireshghallah and Sewon Min and Weijia Shi and Luke Zettlemoyer and Yulia Tsvetkov and Yejin Choi and David Evans and Hannaneh Hajishirzi},
  year={2024},
  journal={arXiv:2402.07841},
}
```
